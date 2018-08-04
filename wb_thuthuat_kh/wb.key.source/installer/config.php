<?php
$configs = [
    'core' => [
        'minPhpVersion' => '7.0.0'
    ],
    'final' => [
        'key' => true,
        'publish' => false
    ],    
    'requirements' => [
        'php' => [
            'openssl',
            'pdo',
            'mbstring',
            'tokenizer',
            'JSON',
            'cURL',
        ],
        'apache' => [
            'mod_rewrite',
        ],
    ],
    'permissions' => [
        'storage/framework/'     => '775',
        'storage/logs/'          => '775',
        'bootstrap/cache/'       => '775',
        'data/assets/'           => '775',
        'data/uploads/'          => '775',
        'database/wb_core.sql'   => '765',
        '.env'                   => '775'
    ],
    'environment' => [
        'form' => [
            'rules' => [
                'app_url'               => 'required|url',
                'database_connection'   => 'required|string|max:50',
                'database_hostname'     => 'required|string|max:50',
                'database_port'         => 'required|numeric',
                'database_name'         => 'required|string|max:50',
                'database_username'     => 'required|string|max:50',
                'database_password'     => 'required|string|max:50',
            ],
        ],
    ],
    'installed' => [
        'redirectOptions' => [
            'route' => [
                'name' => 'welcome',
                'data' => [],
            ],
            'abort' => [
                'type' => '404',
            ],
            'dump' => [
                'data' => 'Dumping a not found message.',
            ]
        ],
    ],
    'installedAlreadyAction' => '',
    'updaterEnabled' => 'true'
];