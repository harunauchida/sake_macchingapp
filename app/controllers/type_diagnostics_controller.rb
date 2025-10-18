class TypeDiagnosticsController < ApplicationController 
  before_action :require_login, only: [:new, :create, :show]

  # 診断フォーム
  def new
    @questions = [
      { id: 1, content: "甘い日本酒が好きですか？", weight: 2 },
      { id: 2, content: "フルーティーな香りが好きですか？", weight: 1 },
      { id: 3, content: "辛口の日本酒も楽しめますか？", weight: 2 }
    ]
  end

  # 診断結果作成
  def create
    total_score = 0
    params[:answers]&.each do |question_id, answer|
      total_score += answer.to_i
    end

    result =
      if total_score >= 5
        "甘口タイプ"
      elsif total_score >= 3
        "フルーティータイプ"
      else
        "辛口タイプ"
      end

    @type = TypeDiagnostic.new(user: current_user, result: result, total_score: total_score)
    if @type.save
      redirect_to @type
    else
      flash.now[:error] = "診断に失敗しました"
      render :new
    end
  end

  # 結果表示
  def show
    @type = TypeDiagnostic.find(params[:id])
  end
end
