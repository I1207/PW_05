# Source
$SourceStorageAccountName = 'itsdati';
$SourceAccountKey = 'yDDzlyQWgo4Ho64rk+CjMcxTYQfxzQJbs7/Lp44JBbCxvwK+vts6DqLIsClpsJjZVOrFtTUhtc+r+ASt+cHd1Q==';
$sourceContainerName = 'dati';
$sourceContext = New-AzStorageContext -StorageAccountName $SourceStorageAccountName -StorageAccountKey $SourceAccountKey;

# Destination
# ***** CHANGE THE DATA WITH YOUR DATA ***
$DestinationStorageAccountName = 'storagepw05';
$DestinationAccountKey = 'lNQeTFOCdlqmrcfLovmaWptj+dLtdINDtIag1+R6+U99hfX3pfBkjBtU7xO1b4PqoQqlD57D0CqH+AStrKN9lw==';
$DestinationContainerName = ‘rawdatainput’;
$destinationContext = New-AzStorageContext -StorageAccountName $DestinationStorageAccountName -StorageAccountKey $DestinationAccountKey;

# Get the list of blobs in the source container
$sourceBlobs = Get-AzStorageBlob -Container $sourceContainerName -Context $sourceContext


# Loop through each blob and start the copy if it doesn't already exist in the destination
foreach ($blob in $sourceBlobs) {
    $destinationBlob = Get-AzStorageBlob -Container $DestinationContainerName -Blob $blob.Name -Context $destinationContext -ErrorAction SilentlyContinue

    # Check if the destination blob already exists
    if (-not $destinationBlob) {
        # Blob doesn't exist in the destination, start the blob copy
        Start-AzStorageBlobCopy -AbsoluteUri $blob.ICloudBlob.Uri.AbsoluteUri -DestContainer $DestinationContainerName -DestBlob $blob.Name -DestContext $destinationContext
    }
}