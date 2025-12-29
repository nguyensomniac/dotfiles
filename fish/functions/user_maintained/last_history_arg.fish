function last_history_arg
    echo $history[1] | read -lat args
    echo $args[-1]
end
