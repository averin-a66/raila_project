require 'uri'
require 'net/http'
require 'net/https'
require 'json'

class YTrans
  OAUTH_TOKEN = "AgAAAAADRRzMAATuwTh3HaSDGkFrh8r1t3MPAv0";
  FOLDER_ID = "b1gknc2fgg7q0q8j5871";

  def self.get_iamToken
    uri = URI('https://iam.api.cloud.yandex.net/iam/v1/tokens')
    res = Net::HTTP.post(uri, '{"yandexPassportOauthToken":"'+OAUTH_TOKEN+'" }')
    res_json = JSON.parse(res.body)
    return res_json['iamToken']
  end

  def self.translate_text text, lang_source='ru', lang_target='en'

    @toSend = {
        'folder_id' => FOLDER_ID,
        'targetLanguageCode' => lang_target,
        'sourceLanguageCode' => lang_source,
        'texts' => [text]
    }.to_json
    begin
      uri = URI.parse('https://translate.api.cloud.yandex.net/translate/v2/translate')
      https = Net::HTTP.new(uri.host,uri.port)
      https.use_ssl = true
      req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' =>'application/json'})
      req['Authorization']='Bearer '+get_iamToken

      req.body = @toSend
       res = https.request(req)
       res_json = JSON.parse(res.body)
       return res_json['translations'][0]['text']
    rescue
      return ''
    end
  end

end
class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes=Recipe.all
  end
  def new
    @recipe=Recipe.new
  end
  def create
    #№render plain: params[:recipe].inspect
    @recipe=Recipe.new(rec_params);

    if (@recipe.save)
    redirect_to edit_recipe_path(@recipe)
    else
        render 'new'
      end
  end

  private def rec_params
    #render plain: params[:post].inspect
    params.require(:recipe).permit(:name, :body, :user_id)

  end

  def show
    @recipe=Recipe.find(params[:id])



  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if(@recipe.update(rec_params))
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path
  end
  def translated_name
    "# {YTrans::translate_text(:name, 'ru', 'en')}"
  end

end
