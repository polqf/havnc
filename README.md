## Home Assistant Dashboard through VNC

_Note_: This is a pre-release, it mostly works on my ~~iPad2~~ iPad 4, most of the time, but unless you want to fiddle I'd wait a bit.

It exposes a web VNC, and also opens poprt 5900 to use a native VPN Client on the iPad (I am using this last option)

Simple add-on which allows you to view and interact with a dashboard (or any other webpage) through a modern chromium instance inside a noVNC webpage.

Very useful in case your browser don't support all the newfangled webstuff but enough to work with older versions of noVNC.

## Usage
~~Clone into your /addons/ folder (you need a way to access that, outside of the scope of this documentation currently). Refresh the addons page and install it.~~

Create a new container on your docker-compose:
```
...

  havnc:
    container_name: havnc
    build:
      context: ./havnc
    volumes:
      - ./havnc-data:/data
    ports:
      - "8080:8080"
      - "5900:5900"
    environment:
      - TZ=Europe/Madrid
    restart: unless-stopped

...
```

Create a folder at the same level of the docker-compose, named `havnc-data`, and place this file:

options.json
```
{
  "url": "http://192.168.0.31:8123/<your path>/0",
  "resolution": "1024x768",
  "password": "<your-password>"
}

```

I am using a landscape resolution


## Tips
[Kiosk-mode](https://github.com/NemesisRE/kiosk-mode) is really useful for a cleaner look.

[ha-lcars](https://github.com/th3jesta/ha-lcars) for the one true interface (as seen in my example photo).
