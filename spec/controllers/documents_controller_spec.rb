require 'rails_helper'

describe DocumentsController do
  describe 'GET #index' do
    it "ドキュメントコントローラ降順で表示されているか" do
      documents = create_list(:document, 3)
      get :index
      expect(assigns(:documents)).to match(documents.sort{|a, b| b.created_at <=> a.created_at })
                                                                    # create_atの降順のためファクトリーボットのdocuments.rb
                                                                    # に新たに内容の追記
                                                                    # created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    end

    it "実際にindexのビューに遷移するか" do
      get :index
      expect(response).to render_template :index
    end
  end
end