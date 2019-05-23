require 'webrick'
require 'certlint'

class CABlintServlet < WEBrick::HTTPServlet::AbstractServlet
    def do_POST request,response
        cert = request.body

        if cert.include? '-BEGIN CERTIFICATE-'
			m, der = CertLint::PEMLint.lint(cert, 'CERTIFICATE')
		else
			m  = []
			der = cert
        end
        
        if !der then
            response.status = 400
            response['Content-Type'] = 'text/plain'
            response.body = "not an certificate"
        end

        m += CertLint::CABLint.lint(der)
        response.status = 200
        response['Content-Type'] = 'text/plain'
        response.body = m.join(',')
    end
end

class UpdateDataServlet < WEBrick::HTTPServlet::AbstractServlet
    def do_GET request,response
        #cur = Dir.pwd
        my_script = "./update-data.sh"
        output = %x( #{my_script} )
        response.status = 200
        response['Content-Type'] = 'text/plain'
        response.body = "updated"
    end
end

server = WEBrick::HTTPServer.new :Port => 8000
trap 'INT' do server.shutdown end
    server.mount '/cablint', CABlintServlet
    server.mount '/updatedata', UpdateDataServlet
server.start