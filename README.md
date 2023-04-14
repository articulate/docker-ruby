# Articulate Ruby Images

Base Ruby images for Articulate services.

## Tags

| Tag                       | Ruby | Node | Postgres | ImageMagick | QT |
|---------------------------|------|------|----------|-------------|----|
| 3.2-bullseye-slim-minimal | 3.2  | ❌   | ❌       | ❌          | ❌ |
| 3.2-bullseye-slim         | 3.2  | 18   | ✅       | ✅          | ❌ |
| 3.2-bullseye-slim-qt      | 3.2  | 18   | ✅       | ✅          | ✅ |
| 3.1-bullseye-slim-minimal | 3.1  | ❌   | ❌       | ❌          | ❌ |
| 3.1-bullseye-slim         | 3.1  | 16   | ✅       | ✅          | ❌ |
| 3.1-bullseye-slim-qt      | 3.1  | 16   | ✅       | ✅          | ✅ |
| 2.7-bullseye-slim         | 2.7  | 16   | ✅       | ✅          | ❌ |
| 2.6-bullseye-slim-qt      | 2.7  | 16   | ✅       | ✅          | ✅ |
| 2.7-buster-slim-minimal   | 2.7  | ❌   | ❌       | ❌          | ❌ |
| 2.7-buster-slim           | 2.7  | 12   | ✅       | ✅          | ❌ |
| 2.7-buster-slim-qt        | 2.7  | 12   | ✅       | ✅          | ✅ |

## Adding a Tag

1. Create directory for the tag `{version}-{os}-{variant}`
2. Add Dockerfile and any related files to directory
3. Update the `Makefile`
4. Add the tag to the Github Action workflows (`.github/workflows`)
5. Create a Pull Request

## Testing Locally

1. Run `make` to build a `local/articulate-ruby` image locally
2. Change the first line of your `Dockerfile` to be:

```dockerfile
FROM local/articulate-ruby:<tag>
```

3. Build and run the image

```shell
docker-compose build --no-cache && docker-compose up
```
