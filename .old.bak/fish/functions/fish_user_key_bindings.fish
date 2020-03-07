function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function bind_dollar
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar

    for mode in insert default visual
        bind -M $mode \cx forward-char
        bind -M $mode \cf forward-word
        bind -M $mode \ca beginning-of-line
        bind -M $mode \ce end-of-line
        bind -M $mode \cp history-search-backward
        bind -M $mode \cn history-search-forward
    end

    bind -M insert \cc kill-whole-line force-repaint
end


fzf_key_bindings
