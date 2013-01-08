# wintersmith-snockets

[Snockets](https://github.com/TrevorBurnham/snockets) plugin for [wintersmith](https://github.com/jnordberg/wintersmith).

### install:

    npm install wintersmith-coffee
  
then add `./node_modules/wintersmith-snockets/` to `config.json` like:

    {
      "locals": {
        "url": "http://localhost:8080",
        "name": "The Wintersmith's blog",
        "owner": "The Wintersmith",
        "description": "-32°C ain't no problems!",
        "index_articles": 3
      },
      "plugins": [
        "./node_modules/wintersmith-snockets/"
      ]
    }
    
### Test

Test is written using [Mocha](http://visionmedia.github.com/mocha/). Install it globally, then run

    $ mocha

or
  
    $ npm test