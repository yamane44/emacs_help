# EmacsHelp

emacsの編集操作のキーバインドを表示するヘルプ．日本語がデフォルト

すぐにいらんようになるやろけど．．．超初心者向け．

[![Gem Version](https://badge.fury.io/rb/emacs_help.svg)](https://badge.fury.io/rb/emacs_help)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'emacs_help'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emacs_help

## Usage

```

 特殊キー操作:c-f, controlキーを押しながらf, M-f, escキーを押した後一度離してf
 操作の中断c-g, 操作の取り消し(Undo) c-x u

Usage: eh [options]
    -v, --version                  show program Version.
    -c, --カーソル                 Cursor移動
    -p, --ページ                   Page移動
    -f, --ファイル                 File操作
    -e, --編集                     Edit操作
    -w, --ウィンドウ               Window操作
    -b, --バッファ                 Buffer操作
    -q, --終了                     終了操作
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec emacs_help` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## programの狙い

### CUIに日本語を組み込むことの可能性

```
Rubyは日本語がcommandにも普通に使えますが，
それを組み込んだ時にどれほど使いやすいのかを検証することもこのCUIの目的の一つです．
初心者にとって，たんに日本語でできるだけでいいのか，英語を覚えていく方がいいのか．．．
あるいは，英語commandを覚える一歩として簡単に表示でけへんか．
さらに，知識の定着とともにいつもみるcheat memoが進化して，手軽に出せるようにするには．．．
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/emacs_help. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

