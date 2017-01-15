<?php 
    
return [
        'options' => ['class' => 'sidebar-menu'],
        'items' => [
            ['label' => 'INVENTARIO', 'options' => ['class' => 'header']],
            [
                'label' =>  'STOCKS',
                'icon'  =>  'fa fa-database',
                'url'   =>  '#',
                'visible' => !Yii::$app->user->isGuest,
                'items'  => [
                    // ['label' => 'items', 'icon' => 'fa fa-briefcase', 'url' => ['/inventario/items']],
                    //['label' => 'Manager',          'icon' => 'fa fa-briefcase',        'url' => ['/inventario/items']],
                    ['label' => 'Inventarios',   'icon' => 'fa fa-hourglass-end',    'url' => ['/inventario/inventario']],
                    ['label' => 'Flujos',        'icon' => 'fa fa-eyedropper',       'url' => ['/inventario/stock']],
                ]
            ],
            [
                'label' =>  'ITEMS',
                'icon'  =>  'fa fa-database',
                'url'   =>  '#',
                'visible' => !Yii::$app->user->isGuest,
                'items'  => [
                    // ['label' => 'items', 'icon' => 'fa fa-briefcase', 'url' => ['/inventario/items']],
                    //['label' => 'Manager',          'icon' => 'fa fa-briefcase',        'url' => ['/inventario/items']],
                    ['label' => 'Reactivos',        'icon' => 'fa fa-hourglass-end',    'url' => ['/inventario/reactivo']],
                    ['label' => 'Materiales',       'icon' => 'fa fa-eyedropper',       'url' => ['/inventario/material']],
                    ['label' => 'Equipos',          'icon' => 'fa fa-laptop',           'url' => ['/inventario/equipo']],
                    ['label' => 'Herramientas',     'icon' => 'fa fa-gavel',            'url' => ['/inventario/herramienta']],
                ]
            ],
            /* descomentar para activar debug y el modulo gii
            ['label' => 'Gii', 'icon' => 'fa fa-file-code-o', 'url' => ['/gii']],
            ['label' => 'Debug', 'icon' => 'fa fa-dashboard', 'url' => ['/debug']],
            */
            ['label' => 'Login', 'url' => ['site/login'], 'visible' => Yii::$app->user->isGuest],
            ['label' => 'ACCESO Y CUENTAS', 'options' => ['class' => 'header']],
            [
                'label' => 'ROLES Y PERMISOS',
                'icon' => 'fa fa-share',
                'url' => '#',
                'items' => [
                    ['label' => 'Roles',    'icon' => 'fa fa-street-view',    'url' => ['/admin/manager#roles']],
                    ['label' => 'Acciones', 'icon' => 'fa fa-unlock-alt',    'url' => ['/admin/manager#actions']],
                    ['label' => 'Asignaciones (perfiles)', 'icon' => 'fa fa-tty',  'url' => ['/admin/manager#profile-roles'],],
                ],
            ],
            ['label' => 'CUENTAS Y USUARIOS', 'options' => ['class' => 'disabled'], 'icon' => 'fa fa-users', 'url' => ['/admin/manager#accounts']],
        ],
    ];

?>