require 'rubygems'
require 'httparty'

include HTTParty

default_timeout 2

apps = [:mom, :apu, :chief, :boss, :gil]

Shoes.app :width => 700 do
  stack do 
    flow :margin => 10 do 
      para "Enter Base-URL"
      @url = list_box :items =>['http://primus:28080/', 'http://pluto:28080/']
      button "Press me" do
        apps.each do |app_name|
          begin
              url_to_call="#{@url.text}#{app_name.to_s}"
              response = HTTParty.get(url_to_call)
              @logs.append do 
                para "Url=#{url_to_call}, response-code=#{response.code}, response-message=#{response.message}\n", :margin => 1
              end 
          rescue Exception => b
            @logs.append do 
              para "Unable to call=#{url_to_call}, #{b}", :margin => 1
            end
          end
      end
      end
    end
    @logs = stack(:margin => 1) do 
      para "sas"
    end
  end
end
