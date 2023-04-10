install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt &&\
		    brew install libmagic &&\
			    pip install "unstructured[local-inference]" &&\
					python -m pip install 'git+https://github.com/facebookresearch/detectron2.git' &&\
						brew install poppler &&\
							export PATH="/usr/local/opt/poppler/bin:$PATH" &&\
								source ~/.bash_profile

test:
	python -m pytest -vv --cov=main --cov=mylib test_*.py

format:	
	black *.py 

lint:
	pylint --disable=R,C --ignore-patterns=test_.*?py *.py mylib/*.py

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

refactor: format lint

deploy:
	#deploy goes here
		
all: install lint test format deploy