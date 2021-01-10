require 'spec_helper'

describe 'codenamephp_workstation_php::php' do
  context 'When all attributes are default' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'sets up docker' do
      expect(chef_run).to include_recipe('codenamephp_workstation_php::docker')
    end

    it 'pulls the phpmyadmin image' do
      expect(chef_run).to pull_docker_image('php-dev').with(repo: 'codenamephp/php.webdevops.php-dev')
    end

    it 'pulls the phpmyadmin image' do
      expect(chef_run).to pull_docker_image('php-dev:8.0').with(repo: 'codenamephp/php.webdevops.php-dev', tag: '8.0')
    end
  end
end
