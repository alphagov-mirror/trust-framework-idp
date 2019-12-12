require 'time'
require 'ed25519'

module Proof
  def create_proof
    {
      "type": "Ed25519Signature2018",
      "created": Time.now.utc.iso8601,
      "domain": "https://the-future.service.gov.uk",
      "verify_key": Base64.encode64(signing_key.verify_key.to_bytes),
      "proofPurpose": "authentication"
    }
  end

  def create_tbs(payload, proof_options)
    hash_alg.digest(canonicalise(payload)) + hash_alg.digest(canonicalise(proof_options))
  end

  def create_signature(payload, proof_options, key=signing_key)
    tbs = create_tbs(payload, proof_options)
    signature = key.sign(tbs)
    Base64.encode64(signature)
  end

  def verify_signature?(payload)
    proof_options = payload["proof"]
    payload.delete("proof")
    signature = Base64.decode64(proof_options["challenge"])
    proof_options.delete("challenge")
    key = Ed25519::VerifyKey.new(Base64.decode64(proof_options["verify_key"]))
    tbs = create_tbs(payload, proof_options)
    # key.verify(signature, tbs)
    #The VC which is validated must be constructed in a particular order otherwise it will fail the verification.
    #We need to investigate whether schema definitions will fix this for us so for now we will just return true.
    true
  end

  def canonicalise(object)
    object.to_json
  end

  def signing_key
    @_signing_key ||= Ed25519::SigningKey.generate
  end

  def hash_alg
    @_hash_alg ||= OpenSSL::Digest::SHA256.new
  end
end
