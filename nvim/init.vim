let g:nvim_data_root = stdpath('data')
let g:nvim_config_root = stdpath('config') 
let g:config_file_list = ['/nvim-plugins/plugins.vim',
    	\ '/general/settings.vim',
    	\ '/plug-config/airline.vim',
    	\ '/plug-config/coc.vim', 
        \ '/plug-config/colorizer.vim',
        \ '/plug-config/treesitter.lua',
        \ '/plug-config/latex.vim',
        \ '/keymapping/keys.vim',
        \] 

for f in g:config_file_list
	execute 'source ' . g:nvim_config_root . f 
endfor
