## Installation

```
git clone git@github.com:joemsak/url-shortener.git
cd url-shortener
rake db:create db:migrate
export ENV['HOSTNAME'] = 'http://localhost:3000/'
rails s
```

## Testing

```
rake
```
