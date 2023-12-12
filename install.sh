mv ~/.config/nvim ~/.config/nvim-old
ln -s $(pwd)/nvim/ ~/.config/nvim

mv ~/.config/hypr ~/.config/hypr-old
ln -s $(pwd)/hypr/ ~/.config/hypr

mv ~/.config/fish ~/.config/fish-old
ln -s $(pwd)/fish/ ~/.config/fish

mv ~/.config/kitty ~/.config/kitty-old
ln -s $(pwd)/kitty/ ~/.config/kitty

mv ~/.config/waybar ~/.config/waybar
ln -s $(pwd)/waybar/ ~/.config/waybar
