function mkcd --description 'Create a directory and move into it'
    if test (count $argv) -eq 1
        mkdir -p $argv
        and cd $argv
    else
        echo "Usage: mkcd <directory_path>"
    end
end
