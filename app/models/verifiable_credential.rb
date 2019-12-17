require 'time'

class VerifiableCredential
  include Proof

  def build
    {
      "@context": [
        "https://www.w3.org/2018/credentials/v1"
      ],
      "type": ["VerifiableCredential", "ExampleAddressCredential"],
      "id": "https://example.org/credentials/1234",
      "issuer": "https://example.org/people#me",
      "issuanceDate": Time.now.utc.iso8601,
      "credentialSubject": {
        "id": "did:gov:#{SecureRandom.uuid}",
        "type": "Person",
        "address": {
          "type": "PostalAddress",
          "street": "St. Paul's Churchyard",
          "town": "City of London",
          "county": "Greater London",
          "postCode": "EC4M 8AD",
          "country": "UK"
        }
      }
    }
  end

  def attach_proof(payload)
    proof_options = create_proof
    proof_options.merge!("challenge": create_signature(payload, proof_options))
    payload.merge("proof": proof_options)
  end

private

  def example_address_context
    {
      "version": 1.1,
      "@protected": true,
      "ExampleAddressCredential": "https://example.org/ExampleAddressCredential", # could have also chosen a URI like urn:private-example:ExampleAddressCredential
      "Person": {
        "@id": "http://schema.org/Person",
        "@context": {
          "@version": 1.1,
          "@protected": true,
          "address": "http://schema.org/address"
        }
      },
      "PostalAddress": {
        "@id": "http://schema.org/PostalAddress",
        "@context": {
          "@version": 1.1,
          "@protected": true,
          "street": "http://schema.org/streetAddress",
          "town": "http://schema.org/addressLocality",
          "county": "http://schema.org/addressRegion",
          "postCode": "http://schema.org/postalCode",
          "country": "http://schema.org/addressCountry"
        }
      }
    }
  end
end
