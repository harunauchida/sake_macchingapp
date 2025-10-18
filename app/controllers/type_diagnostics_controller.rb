class TypeDiagnosticsController < ApplicationController 
  before_action :require_login, only: [:new, :create, :show]

  # 診断フォーム
  def new
    @questions = [
      { id: 1, content: "甘い飲み物は好きですか？", weight: 1 },
      { id: 2, content: "苦味が強い飲み物も飲めますか？", weight: 2 },
      { id: 3, content: "フルーツのような香りがあるお酒は好きですか？", weight: 1 },
      { id: 4, content: "さっぱりした味わいのお酒が好みですか？", weight: 1 },
      { id: 5, content: "濃い味よりも軽い味が飲みやすいですか？", weight: 1 },
      { id: 6, content: "少しアルコール感があるお酒も大丈夫ですか？", weight: 1 },
      { id: 7, content: "お酒は冷やして飲みたいですか？", weight: 1 },
      { id: 8, content: "香りが強いお酒はちょっと苦手ですか？", weight: 1 },
      { id: 9, content: "フルーティーな香りや味があるお酒に興味がありますか？", weight: 1 }
    ]
  end

  # 診断結果作成
  def create
    answers_hash = params[:answers] || {}

    # チェックなしの場合の処理
    if answers_hash.empty?
      redirect_to new_type_diagnostic_path, alert: "1つ以上チェックしてください"
      return
    end

    total_score = answers_hash.values.map(&:to_i).sum

    # 結果判定
    result =
      if total_score <= 3
        "甘口タイプ🍶"
      elsif total_score <= 6
        "中口タイプ🍶"
      else
        "辛口タイプ🍶"
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
