echo "Scanning project files..."

repo=https://github.com/django/django.git
docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-bandit-analysis.yml -e bandit_scan_dir="/home/undergrad/sonnacn/scanrepo" -e bandit_report_file="/home/undergrad/sonnacn/reports/bandit-django-report.html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/facebook/react.git

docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-bandit-analysis.yml -e bandit_scan_dir="/home/undergrad/sonnacn/scanrepo" -e bandit_report_file="/home/undergrad/sonnacn/reports/bandit-react-report.html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/vuejs/vue.git

docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-bandit-analysis.yml -e bandit_scan_dir="/home/undergrad/sonnacn/scanrepo" -e bandit_report_file="/home/undergrad/sonnacn/reports/bandit-vue-report.html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/angular/angular.git

docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-bandit-analysis.yml -e bandit_scan_dir="/home/undergrad/sonnacn/scanrepo" -e bandit_report_file="/home/undergrad/sonnacn/reports/bandit-angular-report.html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/rails/rails

docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-bandit-analysis.yml -e bandit_scan_dir="/home/undergrad/sonnacn/scanrepo" -e bandit_report_file="/home/undergrad/sonnacn/reports/bandit-ror-report.html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/google/googletest

docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-bandit-analysis.yml -e bandit_scan_dir="/home/undergrad/sonnacn/scanrepo" -e bandit_report_file="/home/undergrad/sonnacn/reports/bandit-googletest-report.html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/transloadit/uppy

docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-bandit-analysis.yml -e bandit_scan_dir="/home/undergrad/sonnacn/scanrepo" -e bandit_report_file="/home/undergrad/sonnacn/reports/bandit-uggy-report.html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/p-ranav/pprint

docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-bandit-analysis.yml -e bandit_scan_dir="/home/undergrad/sonnacn/scanrepo" -e bandit_report_file="/home/undergrad/sonnacn/reports/bandit-pprint-report.html"
docker stop owasp-jenkins && docker rm owasp-jenkins

echo "Cleaning up..."
docker volume rm $(docker volume ls -f dangling=true -q)

echo "Scanning dependencies..."

repo=https://github.com/django/django.git
docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-owasp-analysis.yml -e owasp_scan_dir="/home/undergrad/sonnacn/scanrepo" -e owasp_report_file="/home/undergrad/sonnacn/reports/owasp-django-report-$(date +'%Y-%m-%d-%H-%M-%S').html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/facebook/react.git
docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-owasp-analysis.yml -e owasp_scan_dir="/home/undergrad/sonnacn/scanrepo" -e owasp_report_file="/home/undergrad/sonnacn/reports/owasp-react-report-$(date +'%Y-%m-%d-%H-%M-%S').html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/vuejs/vue.git
docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-owasp-analysis.yml -e owasp_scan_dir="/home/undergrad/sonnacn/scanrepo" -e owasp_report_file="/home/undergrad/sonnacn/reports/owasp-vue-report-$(date +'%Y-%m-%d-%H-%M-%S').html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/angular/angular.git
docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-owasp-analysis.yml -e owasp_scan_dir="/home/undergrad/sonnacn/scanrepo" -e owasp_report_file="/home/undergrad/sonnacn/reports/owasp-angular-report-$(date +'%Y-%m-%d-%H-%M-%S').html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/rails/rails
docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-owasp-analysis.yml -e owasp_scan_dir="/home/undergrad/sonnacn/scanrepo" -e owasp_report_file="/home/undergrad/sonnacn/reports/owasp-ror-report-$(date +'%Y-%m-%d-%H-%M-%S').html" 
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/google/googletest
docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-owasp-analysis.yml -e owasp_scan_dir="/home/undergrad/sonnacn/scanrepo" -e owasp_report_file="/home/undergrad/sonnacn/reports/owasp-googletest-report-$(date +'%Y-%m-%d-%H-%M-%S').html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/transloadit/uppy
docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-owasp-analysis.yml -e owasp_scan_dir="/home/undergrad/sonnacn/scanrepo" -e owasp_report_file="/home/undergrad/sonnacn/reports/owasp-uppy-report-$(date +'%Y-%m-%d-%H-%M-%S').html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)


repo=https://github.com/p-ranav/pprint
docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-owasp-analysis.yml -e owasp_scan_dir="/home/undergrad/sonnacn/scanrepo" -e owasp_report_file="/home/undergrad/sonnacn/reports/owasp-pprint-report-$(date +'%Y-%m-%d-%H-%M-%S').html"
docker stop owasp-jenkins && docker rm owasp-jenkins

echo "Cleaning up..."
docker network prune
docker system prune
docker volume rm $(docker volume ls -f dangling=true -q)
