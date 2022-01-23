# Must have `sentry-cli` installed globally
# Following variables must be passed in

SENTRY_AUTH_TOKEN=4225f6fb62d44090826abfb2287349985909b5f74fba4ea99f14497ae2f2184a
SENTRY_ORG=test-9z1
SENTRY_PROJECT=javascript
REACT_APP_RELEASE_VERSION=`sentry-cli releases propose-version`


setup_release: create_release upload_sourcemaps associate_commits

create_release: 
	sentry-cli releases -o $(SENTRY_ORG) new -p $(SENTRY_PROJECT) $(REACT_APP_RELEASE_VERSION)

upload_sourcemaps: 
	sentry-cli releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) files $(REACT_APP_RELEASE_VERSION) upload-sourcemaps --url-prefix "http://localhost:5000/static/js" --validate build/static/js --rewrite

associate_commits: 
	sentry-cli releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) set-commits --auto $(REACT_APP_RELEASE_VERSION)

# sentry-cli releases -o healbone -p javascript set-commits --auto 147dee3ae77f97e08ef8148c2bf4bfd6dd0063d2
# 147dee3ae77f97e08ef8148c2bf4bfd6dd0063d2

# sentry-cli releases -o healbone -p javascript files 147dee3ae77f97e08ef8148c2bf4bfd6dd0063d2 upload-sourcemaps --url-prefix "~/static/js" --validate build/static/js

# sentry-cli releases -o healbone -p javascript set-commits --auto 147dee3ae77f97e08ef8148c2bf4bfd6dd0063d2
# 147dee3ae77f97e08ef8148c2bf4bfd6dd0063d2