module DNS
  class Header
    PACKET_ID = 1234
    
    def initialize
      @id = PACKET_ID
      @qr = 1          # Response packet
      @opcode = 0      # Standard query
      @aa = 0          # Not authoritative
      @tc = 0          # Not truncated
      @rd = 0          # Recursion not desired
      @ra = 0          # Recursion not available
      @z = 0           # Reserved bits
      @rcode = 0       # No error
      @qdcount = 0     # No questions
      @ancount = 0     # No answers
      @nscount = 0     # No authority records
      @arcount = 0     # No additional records
    end

    def to_bytes
      # First 16 bits: ID (16 bits)
      bytes = [id].pack('n')
      
      # Second 16 bits: Various flags
      flags = (qr << 15) |      # QR (1 bit)
              (opcode << 11) |  # OPCODE (4 bits)
              (aa << 10) |      # AA (1 bit)
              (tc << 9) |       # TC (1 bit)
              (rd << 8) |       # RD (1 bit)
              (ra << 7) |       # RA (1 bit)
              (z << 4) |        # Z (3 bits)
              rcode             # RCODE (4 bits)
      
      bytes += [flags].pack('n')
      
      # Remaining fields: QDCOUNT, ANCOUNT, NSCOUNT, ARCOUNT (16 bits each)
      bytes += [qdcount, ancount, nscount, arcount].pack('n*')
      
      bytes
    end

    private

    attr_reader :id, :qr, :opcode, :aa, :tc, :rd, :ra, :z, :rcode,
                :qdcount, :ancount, :nscount, :arcount
  end
end 