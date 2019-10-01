## Hiera data guidelines

Some guidelines for data added into hiera are as follows:

  - Encrypted eyaml values should be limited to type String.
  - Hiera data keys should identify what profile they are being called from.

  
## About this data

All this data is example data.  The encrypted data has been encrypted with the keys provided in `<control-repo/keys/` directory.  All these files should be deleted as well as the keys then regenerated if this repository is going to be used.