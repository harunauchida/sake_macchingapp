class TypeDiagnosticsController < ApplicationController  
  before_action :require_login, only: [:new, :create, :show]

  # 診断フォーム
  def new
    @questions = [
      { id: 1, content: "甘い飲み物は好きですか？", flavor: "甘口" },
      { id: 2, content: "苦味が強い飲み物も飲めますか？", flavor: "辛口" },
      { id: 3, content: "フルーツのような香りがあるお酒は好きですか？", flavor: "甘口" },
      { id: 4, content: "さっぱりした味わいのお酒が好みですか？", flavor: "中口" },
      { id: 5, content: "濃い味よりも軽い味が飲みやすいですか？", flavor: "中口" },
      { id: 6, content: "少しアルコール感があるお酒も大丈夫ですか？", flavor: "辛口" },
      { id: 7, content: "お酒は冷やして飲みたいですか？", flavor: "中口" },
      { id: 8, content: "香りが強いお酒はちょっと苦手ですか？", flavor: "辛口" },
    ]
  end

  # 診断結果作成
  def create
    answers_hash = params[:answers] || {}

    if answers_hash.empty?
      redirect_to new_type_diagnostic_path, alert: "1つ以上チェックしてください"
      return
    end

    # スコア集計
    scores = { "甘口" => 0, "中口" => 0, "辛口" => 0 }

    # 質問に対応する味タイプマッピング
    flavor_map = {
      1 => "甘口",
      2 => "辛口",
      3 => "甘口",
      4 => "中口",
      5 => "中口",
      6 => "辛口",
      7 => "中口",
      8 => "辛口"
    }

    answers_hash.each do |q_id, answer|
      next unless answer == "はい"
      flavor = flavor_map[q_id.to_i]
      scores[flavor] += 1
    end

    # 最大スコアのタイプを診断結果に
    result = scores.max_by { |_k, v| v }[0]

    # 絵文字付き表示用
    emoji = case result
            when "甘口" then "🍯"
            when "中口" then "🌾"
            when "辛口" then "🔥"
            end
    result_with_emoji = "#{result}タイプ#{emoji}"

    # DB保存
    @type = TypeDiagnostic.new(
      user: current_user,
      result: result_with_emoji,
      total_score: scores[result]
    )

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

    # 絵文字や「タイプ」を除いた純粋な味タイプを取得
    flavor_jp = @type.result.match(/^(甘口|中口|辛口)/)[1] rescue nil

    # 日本語 → 英語に変換（DB検索用）
    flavor_db_map = { "甘口" => "sweet", "中口" => "medium", "辛口" => "dry" }
    flavor = flavor_db_map[flavor_jp]

    # 結果に応じておすすめ日本酒を取得
    @recommended_sakes = flavor.present? ? Sake.where(flavor_type: flavor).limit(6) : []
  end
end
