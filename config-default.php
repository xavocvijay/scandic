<?php
$config['atk4-home-page'] = [
    'page_types' => [
        'home' =>[
            'descr' => 'Page with static template',
            'template' => 'pages/home',
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
        ],
        'ocwmb' => [
            'descr' => 'One column without menu blocks',
            'template' => 'pages/ocwmb',
            'blocks'   => [
                'italic_1_spot'=>'italic',
                'two_columns_1_spot'=>'two columns',
                'quote_1_spot'=>'quote',
            ]
        ],
        'ocwmbb' => [
            'descr' => 'One column without menu big blocks',
            'template' => 'pages/ocwmbb',
            'blocks'   => [
                'italic_1_spot'=>'italic',
                'two_columns_1_spot'=>'two columns',
                'quote_1_spot'=>'quote',
            ]
        ],
        'nb' => [
            'descr' => 'No blocks',
            'template' => 'pages/nb',
            'blocks'   => [
                'italic_1_spot'=>'italic',
                'two_columns_1_spot'=>'two columns',
                'quote_1_spot'=>'quote',
            ]
        ],
    ],
    'block_types' => [
        'italic'=>[
            'template' => 'view/blocks/italic'
        ],
        'quote'=>[
            'template' => 'view/blocks/italic'
        ],
        'two columns' =>[
            'template' => 'view/blocks/italic'
        ],
    ],
];