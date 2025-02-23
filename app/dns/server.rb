module DNS
  class Server
    def initialize(host:, port:)
      @host = host
      @port = port
      @socket = UDPSocket.new
    end

    def start
      socket.bind(host, port)
      puts "DNS Server listening on port #{port}..."

      loop do
        data, client = socket.recvfrom(512)
        handle_dns_request(data, client)
      end
    end

    private

    attr_reader :host, :port, :socket

    def handle_dns_request(data, client)
      # Create DNS response header
      header = DNS::Header.new
      response = header.to_bytes
      
      socket.send(response, 0, client[2], client[1])
    end
  end
end 