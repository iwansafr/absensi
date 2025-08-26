<?php

function is_member()
{
	$return = false;
	$role   = @$_SESSION[base_url() . '_logged_in']['role'];
	if (!empty($role)) {
		if (strtolower($role) == 'member') {
			$return = true;
		}
	}
	return $return;
}

function is($title = '')
{
	$return = false;
	$role   = @$_SESSION[base_url() . '_logged_in']['role'];
	if (!empty($role)) {
		if (strtolower($role) == strtolower($title)) {
			$return = true;
		}
	}
	return $return;
}

function is_instansi()
{
	$return = false;
	$level   = @$_SESSION[base_url() . '_logged_in']['level'];
	if (!empty($level)) {
		if ($level == 5) {
			$return = true;
		}
	}
	return $return;
}

function is_inspektorat()
{
	$return = false;
	$level   = @$_SESSION[base_url() . '_logged_in']['level'];
	if (!empty($level)) {
		if ($level == 4) {
			$return = true;
		}
	}
	return $return;
}
