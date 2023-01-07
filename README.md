# KP app for macos

This is my first approach with Swift and SwiftUI.
Code is a little bit flacky and shitty

## OpenAPI generation

`brew install openapi-generator`
`openapi-generator generate --input-spec ./specs/kino-openapi.yaml --generator-name swift5 --additional-properties=apiNamePrefix=Kinopub,projectName=KinopubApi,legacyDiscriminatorBehavior=false --package-name=KinopubApi -o KinopubApi`
`openapi-generator generate --input-spec ./specs/kino-openapi-auth.yaml --generator-name swift5 --additional-properties=apiNamePrefix=KinopubAuth,projectName=KinopubAuth,legacyDiscriminatorBehavior=false --package-name=KinopubAuth -o KinopubAuth`

