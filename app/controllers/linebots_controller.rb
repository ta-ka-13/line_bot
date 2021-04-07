class LinebotsController < ApplicationController
  # before_action :set_linebot, only: %i[ show edit update destroy ]

require 'line/bot'

protect_from_forgery :except => [:callback]

def client
  @client ||=line::Bot::Client.new{|config|
  config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
  config.cahnnel_token = ENV["LINE_CHANNEL_TOKEN"]
  }
end

def callback
  @post = post.offset(rand(Post.count)).first
  body = request.body.read
  
  signature = request.env['HTTP_X_LINE_SIGNATURE']
  unless cilent.validate_signature(body,signature)
    head :bad_request
end

events = client.parse_events_form(body)

events.each{ |event|

  if event.message['text'].include("テスト")
    response = "アンサー"
  elsif event.message["text"].include?("テストテスト")
    response = "アンサー2"
  elsif event.message['text'].include?("テストテストテスト")
    response = "アンサー3"
  elsif event.message['text'].include?("テストテストテストテスト")
    response = "アンサー4"
  else
    response = @post.name
  end

    case event
    when LINE::Bot::Event::Message
      case event.type
      when Line::Bot::Event::MessageType::Text
        message = {
          type: 'text',
          text: response
        }
        client.reply_message(event['replyToken'],message)
        end
      end
    }
    head :ok
  end
end


  # GET /linebots or /linebots.json
#   def index
#     @linebots = Linebot.all
#   end

#   # GET /linebots/1 or /linebots/1.json
#   def show
#   end

#   # GET /linebots/new
#   def new
#     @linebot = Linebot.new
#   end

#   # GET /linebots/1/edit
#   def edit
#   end

#   # POST /linebots or /linebots.json
#   def create
#     @linebot = Linebot.new(linebot_params)

#     respond_to do |format|
#       if @linebot.save
#         format.html { redirect_to @linebot, notice: "Linebot was successfully created." }
#         format.json { render :show, status: :created, location: @linebot }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @linebot.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /linebots/1 or /linebots/1.json
#   def update
#     respond_to do |format|
#       if @linebot.update(linebot_params)
#         format.html { redirect_to @linebot, notice: "Linebot was successfully updated." }
#         format.json { render :show, status: :ok, location: @linebot }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @linebot.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /linebots/1 or /linebots/1.json
#   def destroy
#     @linebot.destroy
#     respond_to do |format|
#       format.html { redirect_to linebots_url, notice: "Linebot was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_linebot
#       @linebot = Linebot.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def linebot_params
#       params.require(:linebot).permit(:title, :body)
#     end
# end
