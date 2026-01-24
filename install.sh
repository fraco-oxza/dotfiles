mv ~/.config/nvim ~/.config/nvim-old
ln -s $(pwd)/nvim/ ~/.config/nvim

mv ~/.config/hypr ~/.config/hypr-old
ln -s $(pwd)/hypr/ ~/.config/hypr

mv ~/.config/fish ~/.config/fish-old
ln -s $(pwd)/fish/ ~/.config/fish

mv ~/.config/kitty ~/.config/kitty-old
ln -s $(pwd)/kitty/ ~/.config/kitty

mv ~/.config/waybar ~/.config/waybar-old
ln -s $(pwd)/waybar/ ~/.config/waybar

mv ~/.config/tmux ~/.config/tmux-old
ln -s $(pwd)/tmux/ ~/.config/tmux

mv ~/.config/jj ~/.config/jj-old
ln -s $(pwd)/jj/ ~/.config/jj

mv ~/.config/wofi ~/.config/wofi-old
ln -s $(pwd)/wofi/ ~/.config/wofi

mv ~/.config/swaync ~/.config/swaync-old
ln -s $(pwd)/swaync/ ~/.config/swaync
