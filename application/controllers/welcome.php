<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function index()
	{
		$this->load->model('Nav');

		//站点信息
		$data['site'] = $this->db->get('dili_site_settings')->row();

		//主导航
		$data['main_nav'] = $this->Nav->get_nav();

		//友情链接
		$data['flinks'] = $this->Nav->get_nav(2);

		//载入视图
		$this->load->view('welcome_message', $data);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */