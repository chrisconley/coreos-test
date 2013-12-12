import random
from bottle import route, run, template, HTTPError, response

@route('/302-donotcache/<euid>')
def donotcache(euid):
    response.set_header('Cache-Control', 'private, max-age=0, no-cache')
    response.set_header('Expires', 'max-age=0')
    response.set_header('ETag', 'str(random.random())')

    location = 'http://lorempixel.com/100/100/'
    response.set_header('Location', location)
    response.status = 302

    return 'Found'

@route('/302-nocacheheaders/<euid>')
def nocacheheaders(euid):
    location = 'http://lorempixel.com/100/100/'
    response.set_header('Location', location)

    response.status = 302

    return 'Found'

@route('/302-cacheeverything/<euid>')
def cacheeverything(euid):
    response.set_header('Cache-Control', 'max-age=86100')
    response.set_header('Expires', 'max-age=86100')
    response.set_header('ETag', 'everything')

    location = 'http://lorempixel.com/100/100/'
    response.set_header('Location', location)

    response.status = 302

    return 'Found'

@route('/301/<euid>')
def permanent(euid):
    location = 'http://lorempixel.com/100/100/'
    response.set_header('Location', location)

    response.status = 301

    return 'Moved Permanently'

run(host='0.0.0.0', port=8080)
