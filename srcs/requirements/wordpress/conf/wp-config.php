<?php
define('DB_NAME', getenv('WORDPRESS_DB_NAME'));
define('DB_USER', getenv('WORDPRESS_DB_USER'));
define('DB_PASSWORD', file_get_contents(getenv('WORDPRESS_DB_PASSWORD_FILE')));
define('DB_HOST', getenv('WORDPRESS_DB_HOST'));
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY', 'unique_key_1');
define('SECURE_AUTH_KEY', 'unique_key_2');
define('LOGGED_IN_KEY', 'unique_key_3');
define('NONCE_KEY', 'unique_key_4');
define('AUTH_SALT', 'unique_key_5');
define('SECURE_AUTH_SALT', 'unique_key_6');
define('LOGGED_IN_SALT', 'unique_key_7');
define('NONCE_SALT', 'unique_key_8');

define('WP_REDIS_HOST', getenv('REDIS_HOST'));
define('WP_REDIS_PORT', 6379);

$table_prefix = 'wp_';

define('WP_DEBUG', false);

if (!defined('ABSPATH')) {
    define('ABSPATH', dirname(__FILE__) . '/');
}

require_once ABSPATH . 'wp-settings.php';
?>