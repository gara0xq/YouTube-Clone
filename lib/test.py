from googleapiclient.discovery import build

# Set up API key and build the service
api_key = 'AIzaSyDprPGSjbOihw1-5XvdFbdj7O2obhyjt3c'
youtube = build('youtube', 'v3', developerKey=api_key)

# Function to get video details
def get_video_details(query):
    request = youtube.search().list(
        part="snippet",
        q=query,
        type="video",
        maxResults=50  # Get at least 10 results
    )
    response = request.execute()

    videos = []
    for item in response['items']:
        video_details = {
            "video_title": item['snippet']['title'],
            "channel_name": item['snippet']['channelTitle'],
            "thumbnail_url": item['snippet']['thumbnails']['high']['url'],
            "channel_image": item['snippet']['thumbnails']['default']['url'],
            "publish_date": item['snippet']['publishedAt'],
            'video_url': f"https://www.youtube.com/watch?v={item['id']['videoId']}",
            "video_id": item['id']['videoId']
        }

        # Fetch views count and more
        video_info_request = youtube.videos().list(
            part="statistics",
            id=item['id']['videoId']
        )
        video_info = video_info_request.execute()
        video_details['views'] = video_info['items'][0]['statistics']['viewCount']
        videos.append(video_details)

    return videos

# Get the video details for a specific search query
video_list = get_video_details('programming flutter android gameDev League of legend')
for video in video_list:
    print(video)
