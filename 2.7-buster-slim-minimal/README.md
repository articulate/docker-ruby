# Minimal Articulate Ruby 2.5 image

Container image that has a very small footprint both in size and security.

Must have:
1. non-root acct that service may be run under
2. toolset to register a service in consul
3. curl and wget to pull content or packages
4. tools to parse output (like jq)
