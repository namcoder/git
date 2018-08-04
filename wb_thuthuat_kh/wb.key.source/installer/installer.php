<?php

class Installer
{
	private $config = [];
	protected $results = [];
	private $steps = [
		'welcome' => [
			'title' => 'Web Builder Installer',
			'icon' => '',
			'next' => [
				'url' => '/installer/index.php?step=requirements',
				'text' => 'Kiểm tra các yêu cầu cài đặt',
			],
		],
		'requirements' => [
			'title' => 'Các yêu cầu cài đặt',
			'icon' => '<i class="fa fa-list-ul fa-fw" aria-hidden="true"></i>',
			'next' => [
				'url' => '/installer/index.php?step=permissions',
				'text' => 'Kiểm tra phân quyền',
			],
		],
		'permissions' => [
			'title' => 'Kiểm tra phân quyền',
			'icon' => '<i class="fa fa-key fa-fw" aria-hidden="true"></i>',
			'next' => [
				'url' => '/installer/index.php?step=environment',
				'text' => 'Cấu hình môi trường',
			],
		],
		'environment' => [
			'title' => 'Cấu hình môi trường',
			'icon' => '<i class="fa fa-cog fa-fw" aria-hidden="true"></i>',
			'next' => [
				'url' => '/installer/index.php?step=final',
				'text' => 'Tiếp tục',
			],
		],
		'final' => [
			'title' => 'Cài đặt thành công',
			'icon' => '<i class="fa fa-flag-checkered fa-fw" aria-hidden="true"></i>',
			'next' => [
				'url' => '/',
				'text' => 'Đến trang chủ',
			],
		],
	];

	public function __construct()
	{
		include("config.php");
		$this->config = $configs;

		$this->results['permissions'] = [];
        $this->results['errors'] = null;
	}

	public function nextUrl()
	{
		$step = $this->currentStep();
		echo $this->steps[$step]['next']['url'];
	}

	public function nextText()
	{
		$step = $this->currentStep();
		echo $this->steps[$step]['next']['text'];
	}

	public function title()
	{
		$step = $this->currentStep();
		echo $this->steps[$step]['icon'] . ' ' . $this->steps[$step]['title'];
	}

	private function currentStep()
	{
		$step = 'welcome';

		if(!empty($_GET['step'])){
			$step = $_GET['step'];
		}

		return $step;
	}

	public function step($step = '')
	{
		if($step == $this->currentStep()){
			echo 'active';
		}
	}

	public function container()
	{
		$step = 'welcome';

		if(!empty($_GET['step'])){
			$step = $_GET['step'];
		}

		include("views/{$step}.php");;
	}

	public function requirements()
    {
        $phpSupportInfo = $this->checkPHPversion(
            $this->config['core']['minPhpVersion']
        );
        $requirements = $this->checkRequirements(
            $this->config['requirements']
        );

        return ['phpSupportInfo' => $phpSupportInfo, 'requirements' => $requirements];
    }

    public function checkRequirements(array $requirements)
    {
        $results = [];

        foreach($requirements as $type => $requirement)
        {
            switch ($type) {
                case 'php':
                    foreach($requirements[$type] as $requirement)
                    {
                        $results['requirements'][$type][$requirement] = true;

                        if(!extension_loaded($requirement))
                        {
                            $results['requirements'][$type][$requirement] = false;

                            $results['errors'] = true;
                        }
                    }
                    break;
                case 'apache':
                    foreach ($requirements[$type] as $requirement) {
                        if(function_exists('apache_get_modules'))
                        {
                            $results['requirements'][$type][$requirement] = true;

                            if(!in_array($requirement,apache_get_modules()))
                            {
                                $results['requirements'][$type][$requirement] = false;

                                $results['errors'] = true;
                            }
                        }
                    }
                    break;
            }
        }

        return $results;
    }

    public function permissions()
    {
        $permissions = $this->checkPermissions(
            $this->config['permissions']
        );

        return $permissions;
    }

    public function environment()
    {
    	$results = [
    		'message' => '',
    		'data'	=> '',
    		'status' => false
    	];

    	if (!empty($_POST)){
    		$app_url = $_SERVER["REQUEST_SCHEME"] . '://' . $_SERVER['SERVER_NAME'];
    		$envFileData =
		        'APP_NAME=' . 'Web-Builder' . "\n" .
		        'APP_ENV=' . 'production' . "\n" .
		        'APP_KEY=' . 'base64:bODi8VtmENqnjklBmNJzQcTTSC8jNjBysfnjQN59btE=' . "\n" .
		        'APP_DEBUG=' . 'false' . "\n" .
		        'APP_LOG_LEVEL=' . 'debug' . "\n" .
		        'APP_URL=' . $app_url . "\n" .
		        'ASSETS_URL=' . $app_url . '/data/assets' . "\n" .
		        'ASSETS_DIR=' . '/data/assets' . "\n\n" .
		        'DB_CONNECTION=' . 'mysql' . "\n" .
		        'DB_HOST=' . $_POST['database_hostname'] . "\n" .
		        'DB_PORT=' . $_POST['database_port'] . "\n" .
		        'DB_DATABASE=' . $_POST['database_name'] . "\n" .
		        'DB_USERNAME=' . $_POST['database_username'] . "\n" .
		        'DB_PASSWORD=' . $_POST['database_password'] . "\n\n" .
		        'BROADCAST_DRIVER=' . 'log' . "\n" .
		        'CACHE_DRIVER=' . 'file' . "\n" .
		        'SESSION_DRIVER=' . 'file' . "\n" .
		        'QUEUE_DRIVER=' . 'sync' . "\n\n" .
		        'FILESYSTEM_DRIVER=' . 'public' . "\n" .
		        'STORAGE_ROOT=' . realpath('../data/') . "\n" .
		        'STORAGE_URL=' . $app_url . '/data' . "\n" .
		        'STORAGE_ID=' . 'uploads' . "\n";

		    $_SESSION['database'] = [
                'dbhost' => $_POST['database_hostname'],
                'dbport' => $_POST['database_port'],
                'dbname' => $_POST['database_name'],
                'dbuser' => $_POST['database_username'],
                'dbpass' => $_POST['database_password']
            ];

	        $envPath = realpath('../.env');
			if (file_exists($envPath)) {
				file_put_contents($envPath, $envFileData);
				$results['message'] = 'Cài đặt môi trường thành công';
				$results['status'] = true;
	    	}else{
	    		$results['message'] = 'Không thể tạo file môi trường tự động.<br/>Bạn vui lòng tạo file .env với nội dung như bên dưới';
	    		$results['data'] = $envFileData;
	    	}
	    }

	    return $results;
    }

    public function finish()
    {
    	$message = [
    		'finalStatusMessage' => 'Web Builder đã được cài đặt thành công.',
    		'finalEntryLog' => '',
    		'finalEnvFile' => ''
    	];
    	$installedLogFile = realpath('../storage').'/installed';
    	$dateStamp = date("d/m/Y h:i:s");
    	if (file_exists($installedLogFile))
        {
            $msg = 'Web Builder đã được cài đặt thành công lúc: ' . $dateStamp . "\n";
            file_put_contents($installedLogFile, $msg);
            $message['finalEntryLog'] = $msg;
        }

        $envPath = realpath('../.env');
        if (file_exists($envPath)){
        	$message['finalEnvFile'] = file_get_contents($envPath);
        }
        
        return $message;

    }

    public function migrate()
    {
        $dblog = [];
        
        if(!empty($_SESSION['database'])){
            $con = mysqli_connect(
                $_SESSION['database']['dbhost'], 
                $_SESSION['database']['dbuser'], 
                $_SESSION['database']['dbpass'], 
                $_SESSION['database']['dbname'],
                $_SESSION['database']['dbport']
            );
            if (mysqli_connect_errno()){
                $dblog['message'] = 'Không thể kết nối database, vui lòng kiểm tra lại.';
                $dblog['status'] = false;
                return $dblog;
            }

            $filename = realpath('../database/wb_core.sql');

            system('mysql --user='.$_SESSION['database']['dbuser'].' --password='.$_SESSION['database']['dbpass'].' '.$_SESSION['database']['dbname'].'< '.$filename);

            $dblog['message'] = 'Cài đặt môi trường thành công';
            $dblog['status'] = true;
        }

        return $dblog;
    }

    public function checkPHPversion($minPhpVersion)
    {
        $minVersionPhp = $minPhpVersion;
        $currentPhpVersion = $this->getPhpVersionInfo();
        $supported = false;

        if (version_compare($currentPhpVersion['version'], $minVersionPhp) >= 0) {
            $supported = true;
        }

        $phpStatus = [
            'full' => $currentPhpVersion['full'],
            'current' => $currentPhpVersion['version'],
            'minimum' => $minVersionPhp,
            'supported' => $supported
        ];

        return $phpStatus;
    }

    private function getPhpVersionInfo()
    {
        $currentVersionFull = PHP_VERSION;
        preg_match("#^\d+(\.\d+)*#", $currentVersionFull, $filtered);
        $currentVersion = $filtered[0];

        return [
            'full' => $currentVersionFull,
            'version' => $currentVersion
        ];
    }

    public function checkPermissions(array $folders)
    {
        foreach($folders as $folder => $permission)
        {
            if(!($this->getPermission($folder) >= $permission))
            {
                $this->addFileAndSetErrors($folder, $permission, false);
            }
            else {
                $this->addFile($folder, $permission, true);
            }
        }

        return $this->results;
    }

    private function getPermission($folder)
    {
        return substr(sprintf('%o', fileperms(realpath('../'.$folder))), -3);
    }

    private function addFile($folder, $permission, $isSet)
    {
        array_push($this->results['permissions'], [
            'folder' => $folder,
            'permission' => $permission,
            'isSet' => $isSet
        ]);
    }

    private function addFileAndSetErrors($folder, $permission, $isSet)
    {
        $this->addFile($folder, $permission, $isSet);

        $this->results['errors'] = true;
    }
}