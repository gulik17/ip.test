<template>
    <div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <div class="row" v-if="loader">
                        <div class="col-md-12 py-5">
                            <div class="spinner-border text-primary" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </div>
                    </div>
                    <div v-else>
                        <div class="row" v-for="(item, idx) in info" :key="idx">
                            <div class="col-md-12">
                                <div class="title m-b-md">{{ item.channel_name }}</div>
                            </div>
                            <div class="col-md-3 mb-5" v-for="(video, idx) in item.videos" :key="idx">
                                <a href="#" data-toggle="modal" data-target="#videoModal" @click.prevent="modalShow(video.shortcode, video.video_name)">
                                    <img :src="'http://i3.ytimg.com/vi/'+video.shortcode+'/maxresdefault.jpg'" class="img-fluid" alt="">
                                    <div class="h5 mt-4 grid-video-renderer" :title="video.video_name">{{video.video_name}}</div>
                                </a>
                            </div>
                            <div class="col-md-12" v-if="item.videos.length === 8">
                                <button class="btn-load-more btn btn-primary" type="button" disabled v-if="btnLoader">
                                    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                    Загрузка...
                                </button>
                                <button @click="loadMore(item.id)" class="btn-load-more btn btn-primary" v-else>Загрузить все</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="videoModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">{{modalTitle}}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <iframe width="100%" height="350" :src="modalVideo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                loader: true,
                btnLoader: false,
                info: null,
                modalTitle: '',
                modalVideo: ''
            };
        },
        mounted() {
            axios
                .get('http://ip-test.loc/api/channel?limit=8')
                .then(response => (
                    this.info = response.data,
                    this.loader = false
                ));
            $('#videoModal').on('hidden.bs.modal', function (e) {
                $('#videoModal iframe').attr('src', $('#videoModal iframe').attr('src')); // выключаем проигрование видео при закрытии модального окна
            })
        },
        methods: {
            modalShow: function (shortcode, video_name) {
                this.modalVideo = 'https://www.youtube.com/embed/'+shortcode+'?autoplay=1&mute=1'
                this.modalTitle = video_name
            },
            loadMore: function (id) {
                this.btnLoader = true
                axios
                    .get('http://ip-test.loc/api/channel/'+id)
                    .then(response => (
                        this.btnLoader = false,
                        this.info = this.info.map(o => {
                            if (o.id === response.data.id)
                                return response.data
                            return o
                        })
                    ))
            }
        }
    }
</script>

<style>
html, body {
    font-family: sans-serif;
    font-size: 10px;}
a:hover {
    text-decoration: none;}
.grid-video-renderer {
    display: -webkit-box;
    max-height: calc(2 * 1.6rem);
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    -webkit-line-clamp: 2;
    font-size: 1.4rem;
    font-weight: 600;
    line-height: 1.6rem;
    letter-spacing: normal;
    text-align: left;
    color: #333;}
.btn-load-more {
    font-size: 14px;}
</style>
