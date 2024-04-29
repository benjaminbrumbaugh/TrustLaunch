# TrustLaunch
Welcome to TrustLaunch, a project for generating one-liners that can safely boostrap a fresh UNIX system through, wait for it, remote code exectution.

# Self-Referencial
TrustLaunch project is a consumer of TrustLaunch project. You can get started by cloning this project down, or running this TrustLaunch. 

# Caching delays
Just a note, caching layers between the user and the script repository will cause a delay between you updating the script and the new one-liner pulling it. This means after pulling a previous script, if you update it in your repository, and immediatly test the new one-liner, you will likely pull the previous script from the cache until it times out. I've seen this take as long as 30 seconds. In an automated deployment setting, or a tight test loop, or your own rapid-fire iteration with your aderol doped lightning fingers, you might run into this. So remember to account for it. If your consumers are humans, they are not likely running your repository script back-to-back repeatedly within the caching window, so it's unlikely to affect them. If your consumers are machines, the script will return a non-zero status code on failure, so you can sleep and retry if you like.

# Security
TrustLaunch verifies the boostrapping script's integrity before launching it. This means the contents of the launching script must match the hash supplied in the one-liner that the user is running. This guarentees a particular one-liner will result in the same code exectuing every time. However, TrustLaunch doesn't have an identity system to check authenticity. That is to say the script you've told it to run was indeed made by you, or some representative login credential or private key you have. This is great for common software paradigms such as distributing a tool or standing up a development environment. It is not appropriate for high-security environments or production environments. If an attacker can impersonate you and hand out new one-liners as though they are you, and the results of them doing that are bad, like all your data is now encyrpted and being ransomed for bitcoin, remote code exectution is not a good solution for you.
