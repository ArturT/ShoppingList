if [ "$BRANCH" = "master" ]; then
  echo "deploying master to staging"
  cap staging deploy
  cap staging deploy:migrate
elif [ "$BRANCH" = "production" ]; then
  echo "deploying production"
  echo "done nothing"
else
  echo "No deployment for branch: $BRANCH"
fi
