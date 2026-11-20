# Docker Scala InvisiRisk BAF QA

An isolated Scala/sbt Docker-build compatibility test for InvisiRisk Build Application Firewall.

The manually dispatched workflow runs the same Docker build twice:

- `baseline-docker`: standard Docker BuildKit build.
- `ir-docker`: the same Dockerfile through the pinned InvisiRisk BAF BuildKit frontend and proxy.

Each image runs its tests and creates a CycloneDX SBOM during the image build. The workflow copies the SBOM out of the image and uploads it for comparison with IR's collected dependency inventory.

## Required secret

Configure `IR_API_KEY` as a repository Actions secret containing the token for an owned InvisiRisk staging project. Do not use a production token for this QA repository.
