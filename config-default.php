<?php
$config['atk4-home-page'] = [
    'available_languages' => ['en'=>'en_EN'],
    'default_language' => 'en',
    'page_types' => [
        'home' =>[
            'descr' => 'Page with static template',
            'template' => 'pages/home',
        ],
        'markdown_only' =>[
            'descr' => 'Page with markdown only',
            'template' => 'pages/markdown',
            'blocks'   => [
                'h1_spot'=>'h1',
                'markdown'=>'markdown',
            ]
        ],
        'tcm' => [
            'descr' => 'Two columns text with left menu',
            'template' => 'pages/tcm',
            'blocks'   => [
                'italic_1_spot'=>'italic',
                'two_columns_1_spot'=>'two columns',
                'quote_1_spot'=>'quote',
            ]
        ],
        'ocm' => [
            'descr' => 'One column text with left menu and blocks',
            'template' => 'pages/ocm',
            'blocks'   => [
                'header_h2_spot'=>'header h2',
                'paragraph_spot'=>'paragraph',
                'small_block_spot_1'=>'small block',
                'small_block_spot_2'=>'small block',
                'small_block_spot_3'=>'small block',
                'small_block_spot_4'=>'small block',
                'small_block_spot_5'=>'small block',
            ]
        ],
        'ocwmb' => [
            'descr' => 'One column without menu blocks',
            'template' => 'pages/ocwmb',
            'blocks'   => [
                'header_h4_spot'=>'header h4',
                'button_spot_1'=>'button',
                'button_spot_2'=>'button',
                'button_spot_3'=>'button',
                'button_spot_4'=>'button',
                'button_spot_5'=>'button',
                'button_spot_6'=>'button',
                'button_spot_7'=>'button',
                'button_spot_8'=>'button',
                'button_spot_9'=>'button',
                'long_button_spot'=>'long button',
            ]
        ],
        'ocwmbb' => [
            'descr' => 'One column without menu big blocks',
            'template' => 'pages/ocwmbb',
            'blocks'   => [
                'header_h4_spot'=>'header h4',
                'big_block_spot_1'=>'big block',
                'big_block_spot_2'=>'big block',
                'big_block_spot_3'=>'big block',
                'big_block_spot_4'=>'big block',
            ]
        ],
        'nb' => [
            'descr' => 'No blocks',
            'template' => 'pages/nb',
        ],
        'competencies'=>[
            'descr' => 'Competencies&Services landing page',
            'template' => 'pages/competencies',
            'blocks'   => [
                'paragraph_mega_spot'=>'paragraph_mega',
            ]
        ],
        'industry'=>[
            'descr' => 'Industry page',
            'template' => 'pages/industry',
        ],
        'team'=>[
            'descr' => 'Team page',
            'template' => 'pages/team',
            'blocks'   => [
                'paragraph_mega_spot'=>'paragraph_mega',
            ]
        ],
        'jobs'=>[
            'descr' => 'Jobs page',
            'template' => 'pages/jobs',
            'blocks'   => [
                'h1_spot'=>'h1',
                'paragraph_mega_spot'=>'paragraph_mega',
                'tab1_title_spot'=>'blank',
                'paragraph1_spot'=>'paragraph',
                'paragraph2_spot'=>'paragraph',
                'paragraph3_spot'=>'paragraph',
                'tab2_title_spot'=>'blank',
                'paragraph4_spot'=>'paragraph',
                'paragraph5_spot'=>'paragraph',
                'paragraph6_spot'=>'paragraph',
            ]
        ],
    ],
    'block_types' => [
        'blank'=>[
            'template' => 'view/blocks/blank'
        ],
        'markdown'=>[
            'markdown' => true,
            'template' => 'view/blocks/markdown'
        ],
        'h1'=>[
            'template' => 'view/blocks/h1'
        ],
        'italic'=>[
            'template' => 'view/blocks/italic'
        ],
        'quote'=>[
            'template' => 'view/blocks/quote'
        ],
        'two columns' =>[
            'template' => 'view/blocks/two_columns'
        ],
        'header h2'=>[
            'template' => 'view/blocks/header_h2'
        ],
        'paragraph_mega'=>[
            'template' => 'view/blocks/paragraph_mega'
        ],
        'paragraph'=>[
            'template' => 'view/blocks/paragraph'
        ],
        'small block'=>[
            'template' => 'view/blocks/small_block'
        ],
        'button'=>[
            'template' => 'view/blocks/button'
        ],
        'long button'=>[
            'template' => 'view/blocks/long_button'
        ],
        'header h4'=>[
            'template' => 'view/blocks/header_h4'
        ],
        'big block'=>[
            'template' => 'view/blocks/big_block'
        ],
    ],
];