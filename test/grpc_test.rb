gem "minitest"
require "minitest/autorun"

require "grpc"
require "helloworld_services"

# GreeterServer is simple server that implements the Helloworld Greeter server.
class GreeterServer < Helloworld::Greeter::Service
  # say_hello implements the SayHello rpc method.
  def say_hello(hello_req, _unused_call)
    Helloworld::HelloReply.new(message: "Hello #{hello_req.name}")
  end
end

describe GRPC do
  before do
    @s = GRPC::RpcServer.new
    @s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
    @s.handle(GreeterServer)
    @s.run_till_terminated
  end

  it "calls gRPC" do
    stub = Helloworld::Greeter::Stub.new "localhost:50051"
    message = stub.say_hello(Helloworld::HelloRequest.new(name: "world")).message
    message.must_equal "Greetings world"
  end

  after do
    @s.terminate
  end
end
