function fish_greeting
    echo "𝘧𝘪𝘯𝘥 𝘵𝘩𝘢𝘵 𝘴𝘦𝘤𝘳𝘦𝘵 𝘵𝘩𝘪𝘳𝘥 𝘵𝘩𝘪𝘯𝘨, 𝘪 𝘣𝘦𝘭𝘪𝘦𝘷𝘦 𝘪𝘯 𝘺𝘰𝘶 ♡"
    # Show currently playing media on shell start
    if command -v fastfetch &> /dev/null
        set media (fastfetch -s media --pipe --logo none 2>/dev/null | string replace 'Media: ' '' | string replace ' (Playing)' '' | string replace ' (Paused)' '')
        if test -n "$media"
            echo "♫ $media"
        end
    end
end
