# ai-troller

A web server tarpit that slowly streams dumb data to pollute AI training bots. Based on [caddy-defender](https://github.com/JasonLovesDoggo/caddy-defender)

![Build Status](https://github.com/circa10a/ai-troller/workflows/deploy/badge.svg)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/circa10a/ai-troller)

![alt text](https://s3.gifyu.com/images/bbjVl.gif)

## Usage

The docker image is built with a script of an [It's Always Sunny in Philadelphia episode](https://www.imdb.com/title/tt0818015/), where the gang gets addicted to crack. This episode script is streamed to the client via http at a slow pace at `http://localhost:8080`

```console
docker run --rm -p 8080:8080 circa10a/ai-troller
```

## Configuration options

| Environment Variable        | Default Value        | Description                                            |
|-----------------------------|----------------------|--------------------------------------------------------|
| `TROLL_CONTENT`              | `file:///crack.txt` | Path to the content file used in tarpit configuration. |
| `TROLL_TIMEOUT`              | `30s`               | Timeout duration for tarpit connections.               |
| `TROLL_BYTES_PER_SECOND`     | `24`                | Rate limit for how many bytes can be sent per second.  |
| `TROLL_RESPONSE_CODE`        | `200`               | The HTTP response code to return.                      |

## Customize content

Should you not enjoy the script of the crack addiction episode, you can provide your own content via the `TROLL_CONTENT` environment variable.

### Local file content

Mount `./file.txt` into the container:

```console
docker run --rm \
    -p 8080:8080 \
    -e TROLL_CONTENT=file:///file.txt \
    -v ./file.txt:/file.txt \
    circa10a/ai-troller
```

### Content from remote file over HTTP

Use `https://google.com/robots.txt` as the content to stream to clients:

```console
docker run --rm \
    -p 8080:8080 \
    -e TROLL_CONTENT=https://google.com/robots.txt \
    circa10a/ai-troller
```
