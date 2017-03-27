import SimpleHTTPServer
import SocketServer


def redirect_handler_factory():
    """
    Returns a request handler class that redirects to supplied `url`
    """

    class RedirectHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
        def do_GET(self):
            self.send_response(301)
            domain = self.headers['host']
            if ':' in domain:
                domain = domain.split(':')[0]
            self.send_header('Location', "https://" + domain + self.path)
            self.end_headers()

    return RedirectHandler


def main():
    port = 80
    host = '0.0.0.0'

    redirectHandler = redirect_handler_factory()

    handler = SocketServer.TCPServer((host, port), redirectHandler)
    handler.serve_forever()


if __name__ == "__main__":
    main()