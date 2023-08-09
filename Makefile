video:
  docker-compose exec app bash -c "cd /app/media && bin/mp4.sh"

clean:
  rm -rf dist dev-dist node_modules media/video/*

# icons:
#   yarn pwa-assets-generator -c preset.config.ts