require 'httpclient'

module Sportradar
    module HTTP
        module Stream
            class Client
                attr_reader :url, :logger

                def initialize(url, publisher, logger)
                    @url = url
                    @logger = logger
                    @publisher = publisher
                    @client = ::HTTPClient.new(:agent_name => 'SportsData/1.0')
                end

                def start
                    @thread ||= Thread.new do
                        logger.debug "Starting loop"
                        @client.get_content(url, :follow_redirect => true) do |chunk|
                            @publisher.publish(::JSON.parse(chunk)) if @publisher
                        end
                        logger.debug "finished loop"
                    end
                end

                def stop
                    @thread.terminate if @thread
                end

            end
        end
    end
end