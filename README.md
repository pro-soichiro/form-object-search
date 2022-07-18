# README

フォームオブジェクトを使用して、検索と複数モデルの保存、更新、削除を可能にしました。

* Ruby version
Ruby2.7.5

* このリポジトリで実現したこと
  * dockerでRuby on Railsの開発環境を構築した
  * herokuにデプロイした
  * 自動テスト（CircleCI）を導入した
    * pushされたとき、テストが走るようにした
    * mainブランチにマージされたとき、デプロイされるようにした
  * githubにpushされた時、LINE通知が来るようにした

* Reference materials
  * https://takaokouji.github.io/output/form-object/
  * https://applis.io/posts/rails-design-pattern-form-objects#%E3%83%93%E3%83%A5%E3%83%BC
  * https://rails.densan-labs.net/form/relation_register_form.html
