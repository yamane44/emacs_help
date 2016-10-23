# -*- coding: utf-8 -*-
require "optparse"
require "emacs_help/version"

module EmacsHelp
  class Command
    def self.run(argv=[])
      print "\n 特殊キー操作:"
      print "\tc-f, controlキーを押しながらf \n"
      print "\t\tM-f, escキーを押した後一度離してf\n"
      print "\t操作の中断c-g, 操作の取り消し(Undo) c-x u \n\n"
      new(argv).execute
    end

    def initialize(argv=[])
      @argv = argv
      data_path = File.join(ENV['HOME'], '.hikirc')
    end

    def execute
      @argv << '--help' if @argv.size==0
      command_parser = OptionParser.new do |opt|
        opt.on('-v', '--version','show program Version.') { |v|
          opt.version = EmacsHelp::VERSION
          puts opt.ver
        }
        opt.on('-c','--カーソル','Cursor移動') {cursor_move}
        opt.on('-p','--ページ','Page移動') {bulk_move}
        opt.on('-f','--ファイル','File操作') {file}
        opt.on('-e','--編集','Edit操作') {edit}
        opt.on('-w','--ウィンドウ','Window操作') {window}
        opt.on('-b','--バッファ','Buffer操作') {buffer}
        opt.on('-q','--終了','終了操作') {quit}
      end
      begin
        command_parser.parse!(@argv)
      rescue=> eval
        p eval
      end
      exit
    end

    def disp(lines)
      lines.each{|line|
        if line.include?(',')
          show line
        else
          puts line
        end
      }
    end
    def show(line)
      puts "\t#{line}"
    end

    def quit
      cont = ["c-x c-c, Quit emacs, ファイルを保存して終了",
              "c-z, suspend emacs, 一時停止，fgで復活"]
      disp(cont)
    end

    def window
      cont=["c-x 2, 2 windows, 二つに分割",
            "c-x 1, 1 windows, 一つに戻す",
            "c-x 3,  windows, 縦線分割",
            "c-x o, Other windows, 次の画面へ移動"]
      disp(cont)
    end

    def buffer
      cont =[ "c-x b, show Buffer, バッファのリスト",
              "c-x c-b, next Buffer, 次のバッファへ移動"]
      disp(cont)
    end

    def edit
      cont = ["c-d, Delete char, 一字削除",
              "c-k, Kill line, 一行抹消，カット",
              "c-y, Yank, ペースト",
              "c-w, Kill region, 領域抹消，カット",
              "領域選択は，先頭・最後尾でc-spaceした後，最後尾・先頭へカーソル移動",
              "c-s, forward incremental Search WORD, 前へWORDを検索",
              "c-r, backward incremental search WORD, 後へWORDを検索",
              "M-x query-replace WORD1 <return> WORD2：一括置換(y or nで選択)"]
      disp(cont)
    end

    def file
      cont =[ "c-x c-f, Fine file, ファイルを開く",
              "c-x c-s, Save file, ファイルを保存",
              "c-x c-w, Write file NAME, ファイルを別名で書き込む"]
      disp(cont)
    end

    def bulk_move
      cont = ["c-v, move Vertical,    次のページへ",
              "M-v, move ,   前のページへ",
              "c-l, centrise Line, 現在行を中心に",
              "M-<, move Top of file, ファイルの先頭へ",
              "M->, move Bottom of file, ファイルの最後尾へ"]
      disp(cont)
    end

    def cursor_move
      cont = ["c-f, move Forwrard,    前・右へ",
              "c-b, move Backwrard,   後・左へ",
              "c-a, go Ahead of line, 行頭へ",
              "c-e, go End of line,   行末へ",
              "c-n, move Next line,   次行へ",
              "c-p, move Previous line, 前行へ"]
      disp(cont)
    end

  end
end
