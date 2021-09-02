for i in $(ls -d charts/*/); do
  version=$(cat ./$i/Chart.yaml|grep version: | cut -d ' ' -f2)
  chart=$(echo ./$i | cut -d '/' -f3)
  echo $version
  echo $chart
  helm package ${i}/. ;helm template ${i} ${chart}-${version}.tgz --debug && mv *.tgz ./docs/depot/. ;
done
cd docs/depot/;
helm repo index .;
cd ../..
