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
                    <div class="row" v-else>
                        <div class="col-md-12">
                            <div class="title m-b-md">{{ info.channel_name }}</div>
                        </div>
                        <div class="col-md-4 mb-5" v-for="(video, idx) in info.videos" :key="idx">
                            <a href="#" data-toggle="modal" data-target="#videoModal" @click.prevent="modalShow(video.shortcode, video.video_name)">
                                <img :src="'http://i3.ytimg.com/vi/'+video.shortcode+'/maxresdefault.jpg'" class="img-fluid" alt="">
                                <div class="h5 mt-4">{{video.video_name}}</div>
                            </a>
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
                info: null,
                modalTitle: '',
                modalVideo: ''
            };
        },
        mounted() {
            axios
                .get('http://ip-test.loc/api/channel/1?limit=9')
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
            }
        }
    }
</script>
